# Gource Multiple Repository Visualizer

This tool generates a Gource visualization video from multiple Git repositories, combining them into a single timeline. It's perfect for visualizing the development history of related projects or microservices.

## Prerequisites

Before using this script, make sure you have the following installed:

- [Gource](https://github.com/acaudwell/Gource) - For Git repository visualization
- [FFmpeg](https://ffmpeg.org/) - For video encoding
- Bash shell
- `realpath` command (usually comes with coreutils)

### Installation

#### macOS
```bash
# Using Homebrew
brew install gource ffmpeg coreutils
```

#### Ubuntu/Debian
```bash
sudo apt-get install gource ffmpeg coreutils
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
4. Show the total number of lines changed across all repositories
5. Display the maximum number of lines changed in a single commit

## Features

- Combines multiple Git repositories into a single visualization
- Validates repository paths and Git status
- Highlights different users and directories
- Generates high-quality MP4 video (1920x1080 resolution)
- Shows file extensions
- Includes keyboard controls overlay
- Hides mouse cursor and filenames for cleaner visualization
- Enhanced visual effects with bloom and multi-sampling
- Optimized user scaling
- Displays total lines changed in the title

## Video Settings

The default settings are:
- Resolution: 1920x1080 (Full HD)
- Speed: 0.4 (slower than real-time)
- Frame rate: 60 FPS
- Video codec: H.264
- Quality: High (CRF 1)
- Background: Black (#000000)
- Font size: 18px
- Font color: White (#FFFFFF)
- User scale: 1.5x
- Bloom effect: Customized for better visibility
- Title includes total lines changed statistic

## Customization

You can customize the visualization by modifying these options in the script:

- `--background-colour`: Change the background color (hex format)
- `--font-size`: Adjust the size of text
- `--font-colour`: Change the color of text (hex format)
- `--title`: Set a custom title for the visualization
- `--user-scale`: Adjust the size of user avatars
- `--bloom-multiplier` and `--bloom-intensity`: Fine-tune the bloom effect
- `--disable-bloom`: Remove the bloom effect entirely
- `--multi-sampling`: Enable anti-aliasing for smoother edges

## Troubleshooting

If you encounter issues:

1. Make sure all paths to repositories are correct
2. Verify that each directory is a valid Git repository
3. Ensure you have sufficient disk space for temporary files
4. Check that Gource and FFmpeg are properly installed
5. If using relative paths, make sure they are correct relative to your current directory
6. If you get "unknown option" errors, check your Gource version with `gource --version`
7. If repositories are not being recognized, ensure they have a `.git` directory
8. If the video is not generating, check if you have write permissions in the current directory
9. If line change statistics are incorrect, check if your Git log format is standard

Common errors and solutions:

- "directory not supported": Make sure the path points to a valid Git repository
- "unknown option": Your version of Gource might not support some options. Try removing them from the script.
- "Could not find codec parameters": This usually means Gource failed to generate the visualization. Check the repository paths and permissions.
- "Total lines changed: 0": This might indicate an issue with the Git log format or that the repositories have no commits.

## License

This script is open source and available under the MIT License.

## Contributing

Feel free to submit issues and enhancement requests!
