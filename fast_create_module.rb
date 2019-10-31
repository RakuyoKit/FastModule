require 'fileutils'
# require 'xcodeproj'

class ModuleManager

	attr_reader :string_replacements

	# Get the current working directory
	#
	@work_path

	# Get the project name, equivalent to the current `work_path` name
	#
	@project_name
 
	# .xcodeproj
	#
	@xcodeproj_suffix

	def run

		@work_path = Dir.pwd
		@project_name = File.basename(@work_path)

		@xcodeproj_suffix = ".xcodeproj"

		@string_replacements = {
			"TODAYS_DATE" => Time.now.strftime("%Y/%m/%d"),
			"TODAYS_YEAR" => Time.now.year.to_s,
			"MODULETEMPLATE" => @project_name,
		}

		create_git_flow

		clone_template

		remove_template_extra_files
		
		rename

		remove_project_folder

		# create_workspace

		install_pods

		push_to_git

	end

	#--- 1. Git-flow ---------------------------------------------------------#

	def create_git_flow
		`git flow init -d`
		`git push --set-upstream origin develop`
	end

	#--- 2. Clone template ---------------------------------------------------#

	def clone_template
		`git clone -b develop https://github.com/rakuyoMo/FastModule.git`
	end

	def remove_template_extra_files

		Dir.chdir("./FastModule")

		# remove other files
		FileUtils.rm_r('.git')

		['.gitignore', 'LICENSE', 'README.md'].each { |file| 
			if File::exists?(file); FileUtils.rm_f file; end
		}
	end

	#--- 3. Rename -----------------------------------------------------------#

	def rename

		now_folder = Dir.pwd

		Dir.foreach(now_folder) do |file|

			if file !="." and file !=".."

				if File.directory?(file)

					real_name = file.gsub("MODULETEMPLATE", @project_name) 
	
					rename_podspec(file, now_folder, real_name)
					rename_project(file, now_folder, real_name)
					rename_project_folder(file, now_folder, real_name)

				end

			end

		end

		replace_internal_project_settings(now_folder)

	end


	def rename_podspec(file, now_folder, real_name)

		folder = now_folder + "/" + file + "/"

		File.rename(folder + file + ".swift.podspec", folder + real_name + ".swift.podspec")

	end

	def rename_project(file, now_folder, real_name)

		project_folder = now_folder + "/" + file + "/"

		# shared schemes have project specific names
		scheme_path = project_folder + file + ".xcodeproj/xcshareddata/xcschemes/"

		File.rename(scheme_path + file + ".xcscheme", scheme_path + real_name + ".xcscheme")

		# rename xcproject
		File.rename(project_folder + file + @xcodeproj_suffix, project_folder + real_name + @xcodeproj_suffix)

	end

	def rename_project_folder(file, now_folder, real_name)

		now_folder = now_folder + "/"

		ui_test_path = now_folder + file + "/" + file + "UITests"

		if File::exists?(ui_test_path) 
			File.rename(ui_test_path, now_folder + file + "/" + real_name + "UITests")
		end
		
		File.rename(now_folder + file + "/" + file + "Tests", now_folder + file + "/" + real_name + "Tests")
		File.rename(now_folder + file + "/" + file, now_folder + file + "/" + real_name)
		File.rename(now_folder + file, now_folder + real_name)

	end

	def replace_internal_project_settings(now_folder)

		Dir.glob(now_folder + "/**/**/**/**").each do |name|
			next if Dir.exists? name
			text = File.read(name)

			for find, replace in @string_replacements
				text = text.gsub(find, replace)
         	end

        	File.open(name, "w") { |file| file.puts text }

    	end

	end

	#--- 4. Remove -----------------------------------------------------------#

	def remove_project_folder

		Dir.foreach(@work_path + "/FastModule") do |dir|
			if dir !="." and dir !=".."; FileUtils.mv(dir, @work_path); end
		end

		Dir.chdir("..")

		FileUtils.rm_r('FastModule')

	end

	# #--- 5. Create Workspace -------------------------------------------------#

	# def create_workspace

	# 	work_path = @work_path + "/"

	# 	core_project_path = work_path + @project_name + "/" + @project_name + @xcodeproj_suffix
	# 	router_project_path = work_path + @project_name + "Router/" + @project_name + "Router" + @xcodeproj_suffix

	# 	core_project_file_reference = Xcodeproj::Workspace::FileReference.new(core_project_path, 'group')
	# 	router_project_file_reference = Xcodeproj::Workspace::FileReference.new(router_project_path, 'group')
		
	# 	workspace = Xcodeproj::Workspace.new(*[core_project_file_reference, router_project_file_reference])

	# 	workspace_path = work_path + @project_name + ".xcworkspace"

	# 	workspace.save_as(workspace_path)
	# end

	#--- 6. CocoaPods --------------------------------------------------------#

	def install_pods
		`pod install`
	end

	#--- 7. Push -------------------------------------------------------------#

	def push_to_git
		`git add -A && git commit -m "[Script] Create Project" && git push`
	end

end

ModuleManager.new.run
