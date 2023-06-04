def search_for_file(directory_path, target_filename)
  # Print the current directory being checked
  puts("Searching in: " + directory_path)

  # If the directory path contains the target filename, we've found the file
  if directory_path.include? target_filename
    puts ("Found: " + target_filename + " at " + directory_path)
    return true
  # If the current path is a file, but not the one we're looking for
  elsif File.file? directory_path
    return false
  # If the current path is a directory, we should explore its contents
  else
    # For each item in the directory
    Dir.children(directory_path).each do |child|
      child_path = File.join(directory_path, child)

      # Recursively search in this child directory/file
      file_found = search_for_file(child_path, target_filename)

      # If the file was found in the child directory/file, return true
      return true if file_found
    end

    # If the file was not found in any of the child directories/files, return false
    return false
  end
end

search_for_file("/Users/danieltorres/Projects", "create_class_settings.puml")
