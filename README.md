# Qtathon 2024 - MGST Space Suit Projects

A collection of space suit management and simulation applications developed for Qtathon 2024, featuring multiple specialized systems for space mission operations.

![Qt](https://img.shields.io/badge/Qt-6.x-green.svg)
![C++](https://img.shields.io/badge/C++-17-blue.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)

## 📁 Project Structure

```
qtathon-mgst-space-suit/
├── mgsthelmet/               # Space Suit Helmet System
├── tricorder/                # Main Management System
└── README.md                 # This file
```

## 🔧 Code Structure

```
Each project follows:
/                      # Main application source
├── main.cpp           # Application entry point
├── fonts/             # Custom fonts
└── *                  # QML/Qt Code
```

## 🚀 Projects

### 1. MGST Helmet (`mgsthelmet/`)
A specialized space suit control interface with real-time monitoring and system management capabilities.

**Key Features:**
- Real-time vital signs monitoring (O₂, CO₂, temperature, pressure)
- Suit subsystem controls and diagnostics
- Missions and Tasks
- Emergency protocol management
- Intuitive astronaut interface
- System status visualization

### 2. Tricorder (`mgsthelmet/`)
The main management system for mission control, providing comprehensive oversight of multiple space suits and mission parameters.

**Key Features:**
- Multi-suit monitoring dashboard
- Mission control interface
- Data logging and analysis
- Alert and notification system
- Cross-platform compatibility

## 🛠️ Technology Stack

- **Framework**: Qt 6.x
- **Language**: C++17
- **Build System**: CMake
- **UI**: Qt/QML
- **Platform**: Windows, Linux, macOS, Android

## 📦 Installation & Build

### Prerequisites
- Qt 6.2 or higher
- C++17 compatible compiler (GCC, Clang, MSVC)
- CMake 3.16+

### Building Individual Projects

#### Build MGST Space Suit
```bash
cd mgst-space-suit
mkdir build && cd build
cmake ..
make -j4
./mgst-space-suit
```

#### Build Qtathon MGST Space Suit
```bash
cd qtathon-mgst-space-suit
mkdir build && cd build
cmake ..
make -j4
./qtathon-mgst-space-suit
```

### Building All Projects
```bash
# From repository root
mkdir build && cd build
cmake ..
make -j4

# Run specific application
./mgst-space-suit/mgst-space-suit
./qtathon-mgst-space-suit/qtathon-mgst-space-suit
```

## 👨‍💻 Authors

**Luan Pinheiro**
- GitHub: [@luan-p1nheiro](https://github.com/luan-p1nheiro)
- LinkedIn: [@Luan Pinheiro](https://www.linkedin.com/in/luan-pinheiro-24121724a/)

**Vinicius Santos**
- GitHub: [@VSRDev09](https://github.com/VSRDev09)
- LinkedIn: [@Vinicius Santos](https://www.linkedin.com/in/vinicius-santos-vsrdev09/)

## 🙏 Acknowledgments

- **Qt Company** for hosting Qtathon 2024
- **NASA** and space agencies for inspiration
- **Open Source Community** for tools and libraries
- **Contributors** and testers who helped improve the projects

**Built with ❤️ and Qt for the future of space exploration**
