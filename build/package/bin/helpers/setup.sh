# Usage: setup_docker $project_path $course_files $course_code $default_path $script_path
setup_docker() {
  echo "Dropping in a new docker-compose.yml MERN stack file to project path..."
  cp $course_files/docker-compose.yml $project_path/docker-compose.yml
  echo "Creating a new volume \"/var\" for our MySQL server to use... "
  project_var_path="$project_path/var"
  mkdir -p "$project_var_path"
}

# Usage: setup_repository $project_path $course_files $course_code $default_path $script_path
# setup_node() {
#   echo "Setting up NodeJS app files..."
#   cp $course_files/package.json $project_path/package.json
#   cp $course_files/index.js $project_path/index.js
#   echo "Creating empty application directories..."
#   cp -rn $course_files/* $project_path
#   echo "Finished setting up new Node/ExpressJS app..."
# }

# Usage: setup_repository $project_path $course_files $course_code $default_path $script_path
setup_repository() {
  echo "Initializing new Git repository inside project path..."
  initialize_repository "$project_path"
  echo "Initializing new README markdown file inside your project..."
  cp "$course_files"/README.md "$project_path"/README.md
  mv "$project_path"/gitignore "$project_path"/.gitignore
}

# Usage: setup_all $project_path $course_files $course_code $default_path $script_path
setup_all() {

  # Ask the user for a file path
  read -p "Project path [default: ${default_path}]: " project_path
  project_path=${project_path:-$default_path}

  # Check if the path exists
  check_path_exists "$project_path"
  if [[ -n $course_files ]] && [[ -n $project_path ]]; then
    # Copying all contents including files and directories
    cp -r "$course_files/"* "$project_path"
    echo "All files and directories have been copied from $course_files to $project_path."
  else
    echo "One or both of the required paths are not set."
  fi
  setup_repository $1 $2 $3 $3 $4 $5
}
