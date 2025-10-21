# CI/CD App

This project is a TypeScript application that implements a CI/CD pipeline to automate the process of building, testing, and deploying the application to TestFlight upon pushing to GitHub.

## Project Structure

```
ci-cd-app
├── .github
│   └── workflows
│       └── ci-cd.yml       # CI/CD workflow configuration
├── src
│   ├── main.ts              # Entry point of the application
│   └── utils
│       └── helper.ts        # Utility functions
├── package.json             # npm configuration file
├── tsconfig.json            # TypeScript configuration file
├── README.md                # Project documentation
└── .gitignore               # Git ignore file
```

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd ci-cd-app
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Build the application:**
   ```bash
   npm run build
   ```

4. **Run the application:**
   ```bash
   npm start
   ```

## Usage

- The application can be started using the `npm start` command.
- Utility functions can be imported from the `src/utils/helper.ts` file.

## CI/CD Pipeline

The CI/CD pipeline is defined in the `.github/workflows/ci-cd.yml` file. It automates the following processes:

- Building the application
- Running tests
- Deploying the application to TestFlight upon successful builds

## Contributing

Feel free to submit issues or pull requests for any improvements or bug fixes.

## License

This project is licensed under the MIT License.