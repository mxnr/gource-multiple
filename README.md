# Gource Multiple Repository Visualizer

This tool generates a Gource visualization video from multiple Git repositories, combining them into a single timeline. It's perfect for visualizing the development history of related projects or microservices.

## Prerequisites

Before using this script, make sure you have the following installed:

- [Gource](https://github.com/acaudwell/Gource) - For Git repository visualization
- [FFmpeg](https://ffmpeg.org/) - For video encoding
- Bash shell

### Installation

#### macOS
```bash
# Using Homebrew
brew install gource ffmpeg
```

#### Ubuntu/Debian
```bash
sudo apt-get install gource ffmpeg
```

## Usage

1. Make the script executable:
```bash
chmod +x gource-multiple-repository.sh
```

2. Run the script with paths to your Git repositories:
```bash
./gource-multiple-repository.sh /path/to/repo1 /path/to/repo2 /path/to/repo3
```

### Example
```bash
./gource-multiple-repository.sh \
    ~/projects/service-a \
    ~/projects/service-b \
    ~/projects/service-c
```

## Output

The script will:
1. Generate a combined visualization of all repositories
2. Create an MP4 video file named `gource.mp4` in the current directory
3. Display a list of all committers across the repositories

## Features

- Combines multiple Git repositories into a single visualization
- Validates repository paths and Git status
- Highlights different users and directories
- Generates high-quality MP4 video (1600x1080 resolution)
- Shows file extensions
- Includes keyboard controls overlay
- Hides mouse cursor and filenames for cleaner visualization

## Video Settings

The default settings are:
- Resolution: 1600x1080
- Speed: 0.4 (slower than real-time)
- Frame rate: 60 FPS
- Video codec: H.264
- Quality: High (CRF 1)

## Troubleshooting

If you encounter issues:

1. Make sure all paths to repositories are correct
2. Verify that each directory is a valid Git repository
3. Ensure you have sufficient disk space for temporary files
4. Check that Gource and FFmpeg are properly installed

## License

This script is open source and available under the MIT License.

## Contributing

Feel free to submit issues and enhancement requests!
