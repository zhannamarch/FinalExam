import os


# function to read the contents of txt file
def read_file_get_content(file_path):
    with open(file_path) as rfile:
        content = rfile.read()
    return content


# loops over each file in a given folder, processes txt file of diary and saves all infor per file in a list
def process_folder(date_folder_path):
    all_content = {}
    count = 1
    for file in os.listdir(date_folder_path):
        diary_entry = read_file_get_content(os.path.join(f'{date_folder_path}/{file}'))
        all_content[count] = diary_entry
        count += 1

    number_of_entries = len(all_content)
    raw_content = '\n'.join([all_content[i] for i in all_content])
    number_of_words = len(raw_content.split(' '))

    row = [date_folder_path.split('/')[-1], raw_content, number_of_entries, number_of_words]
    return row

# loops over dates and process each folder saving the result for each folder in a list
def process_all_contens(data_folder_path):
    all_dates_contents = []
    for date_folder in os.listdir(data_folder_path):
        date_folder_path = os.path.join(f'{data_folder_path}/{date_folder}')
        row = process_folder(date_folder_path)
        all_dates_contents.append(row)

    return all_dates_contents


# filter observations by specifying threshold for number of entries in a diary per day: (less than)
def filter_by_number_entries(contents, threshold):
    filtered = []
    for row in contents:
        num_entr = row[2]
        if num_entr <= threshold:
            filtered.append(row)
    return filtered


# variable transformation: transform date string and get just integer day
def transform_date(contents):
    new_data = []
    for row in contents:
        date = row[0]
        day = int(date.split('-')[-1])
        new_data.append(row + [day])
    return new_data


# filter variables and leave only numeric
def get_numeric_variables(contents):
    numeric_data = []
    for row in contents:
        new_row = []
        for col in row:
            if type(col) != str:
                new_row.append(col)
        numeric_data.append(new_row)
    return numeric_data


all_dates_contents = process_all_contens('data_folder')

print('My diary:\n', all_dates_contents)

average_number_words_per_day = round(sum([row[-1] for row in all_dates_contents]) / len(all_dates_contents))
print('Average number of words per day in a diary:', average_number_words_per_day, '\n')

filtered = filter_by_number_entries(all_dates_contents, 2)

print('Filtered diary based on number of entries: ', filtered, '\n')

new_data = transform_date(filtered)

print('Diary with numeric day column: ', new_data, '\n')

numeric_data = get_numeric_variables(new_data)

print('Only numeric data from my diary', numeric_data)