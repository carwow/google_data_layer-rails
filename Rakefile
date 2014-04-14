require "bundler/gem_tasks"

desc "Increase the revision number"
task :increase_revision_number do
  version_file = "lib/google_data_layer/rails/version.rb"
  file_content = File.read(version_file)
  rule = /(\d+\.\d+\.)(\d+)/
  new_revision_number = rule.match(file_content)[2].to_i + 1
  new_file_content = file_content.sub(rule, '\1' + new_revision_number.to_s)

  File.open(version_file, 'w') { |file| file.write(new_file_content) }
end
