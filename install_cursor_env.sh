#!/bin/bash

# 检查是否已经存在setup_cursor_env函数
if ! grep -q "setup_cursor_env()" "$HOME/.zshrc"; then
    # 如果不存在,则添加函数定义
    cat << 'EOF' >> "$HOME/.zshrc"

# Function to setup cursor development environment
setup_cursor_env() {
    # Check if Python3 is installed
    if ! command -v python3 &> /dev/null; then
        echo "Error: Python3 is not installed"
        return 1
    fi

    # Get virtual environment name from argument or use default
    venv_name="${1:-venv}"
    
    # Create Python virtual environment
    echo "Creating Python virtual environment: $venv_name..."
    python3 -m venv "$venv_name"
    
    # Activate the virtual environment
    source "$venv_name/bin/activate"
    
    # Copy cursor tools from home directory
    echo "Copying cursor tools from home directory..."
    cp -r "$HOME/cursor_tool_use/.cursorrules" .
    cp -r "$HOME/cursor_tool_use/tools" .
    
    # Replace {venv_path} with actual venv name in .cursorrules
    echo "Updating venv path in .cursorrules..."
    sed -i "" "s|{venv_path}|$venv_name|g" .cursorrules
    
    # Install base requirements if they exist
    if [ -f "$HOME/cursor_tool_use/requirements.base" ]; then
        echo "Installing base requirements..."
        pip install -r "$HOME/cursor_tool_use/requirements.base"
    fi
    
    echo "Cursor environment setup completed!"
}
EOF

    echo "Successfully added setup_cursor_env function to .zshrc"
    # 自动重新加载.zshrc
    exec zsh -l
else
    echo "setup_cursor_env function already exists in .zshrc"
    # 如果函数已存在,也重新加载.zshrc以确保最新版本
    exec zsh -l
fi 