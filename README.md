
# ShiftCare Technical Challenge

This is a minimalist Ruby command-line application for performing searches and finding duplicate emails from a JSON dataset of clients.

## Features
- Search clients by search key and search value.
- Identify clients with duplicate emails, full name and id.
- CLI and API support.

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

### Search by Name
```sh
./bin/search_by <search_key> <search_value> <search_mode>
```
Example:
```sh
./bin/search_by full_name John
```
```sh
./bin/search_by id 34 equal
```

### Search Duplicates
```sh
./bin/search_dup <search_key>
```
Example:
```sh
./bin/search_dup full_name
```
```sh
./bin/search_dup email
```
```sh
./bin/search_dup id
```

## Test
RSpec is used for testing.
```sh
bundle exec rspec
```

## Technical Challenge Document File
You can download the original ShiftCare Technical Challenge PDF here: 
- [ShiftCare Technical Challenge](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/shiftcare-technical-challenge.pdf)
- [ShiftCare Technical Challenge Round 2](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/technical-challenge-shiftcare-round2.pdf)

## Program Output Screenshots
- [Search By(CLI)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/search_by.png)
- [Search Dup(CLI)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/search_dup.png)
- [Search By Full Name(API)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/api_search_by_full_name.png)
- [Search By Email(API)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/api_search_by_email_search_mode_equal.png)
- [Search By ID(API)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/api_search_by_id_search_mode_equal.png)
- [Search Duplicates by Email(API)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/api_search_duplicates_by_email.png)
- [Search Duplicates by Full Name(API)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/api_search_duplicates_by_full_name.png)
- [Search Duplicates by ID(API)](https://github.com/iprog21/shiftCare-technical-challenge/blob/main/api_search_duplicates_by_id.png)

## Future Improvements
- Implement a REST API.

## License
This project is open-source and available under the [MIT License](LICENSE).
