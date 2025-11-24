var missions = [
    {
        id: 1,
        title: "Comms Check",
        description: "Verify all communication systems on the base station. Ensure radios are functioning, antennas are aligned, and backup batteries are available in case of failure.",
        equipments: ["Radio", "Antenna", "Batteries"],
        tasks: [
            { title: "Check radios", maximumAllowedDuration: 180 },
            { title: "Check antenna", maximumAllowedDuration: 180 }
        ]
    },
    {
        id: 2,
        title: "Perimeter Scan",
        description: "Conduct a thorough walk around the base perimeter. Identify potential breaches, unusual activity, or environmental hazards that could threaten operations.",
        equipments: ["Flashlight", "Rope", "Scanner"],
        tasks: [
            { title: "Scan North perimeter", maximumAllowedDuration: 120 },
            { title: "Scan South perimeter", maximumAllowedDuration: 120 }
        ]
    },
    {
        id: 3,
        title: "O2 Inspection",
        description: "Analyze oxygen tanks for pressure levels and overall functionality. Replace or refill any tanks that do not meet safety standards.",
        equipments: ["Oxygen Sensor", "Pressure Gauge", "Spare Tanks"],
        tasks: [
            { title: "Check O2 tank pressure", maximumAllowedDuration: 150 },
            { title: "Replace spare tanks if needed", maximumAllowedDuration: 150 }
        ]
    },
    {
        id: 4,
        title: "Temp Survey",
        description: "Collect environmental temperature readings from multiple locations, both indoors and outdoors, to ensure environmental controls are functioning properly.",
        equipments: ["Thermometer", "Data Logger", "Protective Gloves"],
        tasks: [
            { title: "Measure indoor temperature", maximumAllowedDuration: 100 },
            { title: "Measure outdoor temperature", maximumAllowedDuration: 100 }
        ]
    },
    {
        id: 5,
        title: "Suit Check",
        description: "Perform a full diagnostic on the protective suit. Inspect joints, seals, and helmet for any wear or damage that could compromise safety.",
        equipments: ["Diagnostic Kit", "Sealing Tape", "Backup Helmet"],
        tasks: [
            { title: "Inspect suit joints", maximumAllowedDuration: 150 },
            { title: "Check helmet integrity", maximumAllowedDuration: 150 }
        ]
    },
    {
        id: 6,
        title: "CO2 Check",
        description: "Measure CO2 levels inside the base to ensure safe breathing conditions. Replace filters as needed to maintain air quality.",
        equipments: ["CO2 Meter", "Filter Replacement", "Safety Mask"],
        tasks: [
            { title: "Measure CO2 in cabin", maximumAllowedDuration: 180 },
            { title: "Replace filter if needed", maximumAllowedDuration: 180 }
        ]
    },
    {
        id: 7,
        title: "Power Check",
        description: "Inspect all power cells and circuits. Ensure voltage levels are within operational parameters and replace faulty cells as required.",
        equipments: ["Multimeter", "Spare Cells", "Voltage Tester"],
        tasks: [
            { title: "Check main power cells", maximumAllowedDuration: 150 },
            { title: "Replace faulty cells", maximumAllowedDuration: 150 }
        ]
    },
    {
        id: 8,
        title: "Env Scan",
        description: "Perform a comprehensive environmental scan using sensors and cameras. Record any anomalies or interesting environmental data.",
        equipments: ["Scanner", "Camera", "Sampling Kit"],
        tasks: [
            { title: "Scan nearby environment", maximumAllowedDuration: 200 },
            { title: "Record environmental data", maximumAllowedDuration: 200 }
        ]
    },
    {
        id: 9,
        title: "Data Sync",
        description: "Upload all local mission data to the central server. Ensure all files are complete and backups are created on a secondary drive.",
        equipments: ["Laptop", "Data Cable", "Backup Drive"],
        tasks: [
            { title: "Connect to server", maximumAllowedDuration: 120 },
            { title: "Upload data files", maximumAllowedDuration: 180 }
        ]
    },
    {
        id: 10,
        title: "Nav Calibration",
        description: "Calibrate navigation sensors to maintain positional accuracy. Check compass and GPS systems to avoid navigational errors.",
        equipments: ["Compass", "GPS Device", "Calibration Tool"],
        tasks: [
            { title: "Calibrate compass", maximumAllowedDuration: 150 },
            { title: "Calibrate GPS", maximumAllowedDuration: 150 }
        ]
    }
];

