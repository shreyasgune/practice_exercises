import re
import sys
import pprint
    # example: 127.0.0.1 - rj [13/Nov/2019:14:43:30] "GET HTTP/1.0" 200

def line_reader(file_path):
    with open(file_path, 'r') as file:
        for line in file:
            yield line

def main():
    results = {
        "ip_address": "",
        "client_id": "",
        "user_id": "",
        "timestamp": "",
        "request" : "",
        "status": "",
    }
    result_list = []

    file_path = sys.argv[1] if len(sys.argv) > 1 else ''

    reader = line_reader(file_path)

    # Why are we using yield?
    # Without yield: You might have written line_reader to read the entire file into a list (e.g., using file.readlines()) 
    # and return that whole list. If the log file is very large (gigabytes), this could consume a huge amount of RAM, 
    # potentially crashing your program.

    # With yield: The line_reader function only ever holds one line of the file in memory at a time during the iteration process. 
    # It reads a line, yields it, and effectively "forgets" it (until it needs to read the next one). 
    # This allows your script to process massive log files without running out of memory.

    for lines in reader:
        r = r'(?P<IP>\d+\.\d+\.\d+\.\d+)'
        r += r' - (?P<User>\w+) '
        r += r'\[(?P<Time>\d\d/\w{3}/\d{4}:\d{2}:\d{2}:\d{2})\]'
        r += r' (?P<Request>".+")'
        r += r' (?P<Status>\d+)'
        match = re.finditer(r, lines)
        for m in match:
            results["ip_address"] = m.group('IP')
            results["user_id"] = m.group('User')
            results["timestamp"] = m.group('Time')
            results["request"] = m.group('Request')
            results["status"] = m.group('Status')
            result_list.append(results)
    return result_list


if __name__ == "__main__":
    pprint.pprint(main())