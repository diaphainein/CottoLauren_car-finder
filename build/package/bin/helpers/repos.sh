add_ignore_ref() {
    local ref=$1
    local gitignore_file=$2

    # Check if the .gitignore file path is provided
    if [ -z "$gitignore_file" ]; then
        echo "No .gitignore file path provided."
        return 1
    fi

    # Check if the .gitignore file exists
    if [ ! -f "$gitignore_file" ]; then
        echo "The .gitignore file does not exist at $gitignore_file. Creating one."
        touch "$gitignore_file"
    fi

    # Check if the reference already exists in the file
    if grep -Fxq "$ref" "$gitignore_file"; then
        echo "The reference '$ref' already exists in $gitignore_file."
    else
        echo "Adding '$ref' to $gitignore_file."
        echo "$ref" >> "$gitignore_file"
    fi
}

# Example usage: add_ignore_ref "some_string" "/path/to/.gitignore"

initialize_repository() {
    local repo_dir=$1

    # Check if the directory path is provided
    if [ -z "$repo_dir" ]; then
        echo "No directory path provided."
        return 1
    fi

    # Create the directory if it does not exist
    if [ ! -d "$repo_dir" ]; then
        echo "Directory does not exist. Creating: $repo_dir"
        mkdir -p "$repo_dir"
    fi

    # Change to the directory
    cd "$repo_dir"

    # Initialize the Git repository
    echo "Initializing a new Git repository in $repo_dir"
    git init

    # Set the default branch to 'main'
    git checkout -b main
}

# Example usage: initialize_repository "/path/to/new/repo"

initialize_branches() {
    original_pwd="$(pwd)"
    local repo_dir=$1
    shift  # Shift the arguments to skip the first one (the repository directory)

    # Check if the repository directory and at least one branch name are provided
    if [ -z "$repo_dir" ]; then
        echo "No repository directory provided."
        return 1
    fi
    if [ $# -eq 0 ]; then
        echo "No branch names provided."
        return 1
    fi

    # Change to the repository directory
    if [ -d "$repo_dir" ]; then
        cd "$repo_dir"
    else
        echo "Repository directory does not exist: $repo_dir"
        return 1
    fi

    # Iterate over the provided arguments to create branches
    for branch_name in "$@"; do
        echo "Creating branch: $branch_name in $repo_dir"
        git branch "$branch_name"
    done

    # Change directory back to the original $(pwd)
    cd "$original_pwd"
}

# Example usage: initialize_branches "/path/to/repo" "branch1" "branch2" "branch3"
