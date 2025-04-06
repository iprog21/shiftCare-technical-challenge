
# ShiftCare Technical Challenge

This is a minimalist Ruby command-line application for performing searches and finding duplicate emails from a JSON dataset of clients.

## Features
- Search for clients by partial name matches.
- Identify clients with duplicate emails.
- Easily extensible for additional functionalities.

## Requirements
- Ruby (>= 2.7.0)
- Bundler

## Installation
1. Clone this repository:
```sh
 git clone https://github.com/iprog21/shiftCare-technical-challenge.git
```
2. Install dependencies:
```sh
 bundle install
```

## Usage

### Making the File Executable
Ensure the script is executable by running:
```sh
chmod +x clients_app.rb
```

### Search by Name
```sh
./clients_app.rb search <query>
```
Example:
```sh
./clients_app.rb search John
```

### Find Duplicate Emails
```sh
./clients_app.rb duplicates
```

## Test
RSpec is used for testing.
```sh
bundle exec rspec
```

## File Structure
```plaintext
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── LICENSE
├── ShiftCare Technical Challenge.pdf
├── output.png
├── clients.json
├── clients_app.rb
├── clients_search.rb
├── spec
│   ├── client_search_spec.rb
```

## Technical Challenge Document File
You can download the original ShiftCare Technical Challenge PDF here: [ShiftCare Technical Challenge](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/ShiftCare%20Technical%20Challenge.pdf)

## Program Output
[Output](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/output.png)

## Future Improvements
- Accept any JSON file as input.
- Allow searching by any field (e.g., email, id).
- Implement a REST API.

## License
This project is open-source and available under the [MIT License](LICENSE).

