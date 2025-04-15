check_path_exists() {
  if [ -e "$1" ]; then
    echo "$1 seems to be a valid path. Proceeding forward with task..."
  else
    echo "Error: The path does not exist: $1."
    read -p "Project directory does not exist. Want to create it? [yes/no]" create_project
    if [[ $create_project == "yes" ]] || [[ $create_project == "y" ]]; then
      echo "Initializing a new project at: $1"
      mkdir -p "$1"
    else
      echo "Nothing else to do here. Aborting project setup..."
      exit 1
    fi
  fi
}
