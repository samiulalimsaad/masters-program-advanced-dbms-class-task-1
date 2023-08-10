from faker import Faker
import random

fake = Faker()

# Specify the number of rows
num_rows = 100

department_names = []
course_ids = []
prereq_ids = []
buildings = []
rooms = []
semesters = []
sec_ids = []
student_ids = []
time_slot_ids = []
years = []

cid = 0
pid = 0
tid = 0


# Generate insert statements for the "department" table
def generate_random_data_for_department():
    dept_name = fake.catch_phrase()
    if dept_name not in department_names:
        department_names.append(dept_name)

    building = fake.building_number()
    if building not in buildings:
        buildings.append(building)

    budget = round(random.uniform(10000, 1000000), 2)
    return [f"'{dept_name}'", f"'{building}'", f"{budget:.2f}"]


# Generate insert statements for the "classroom" table
def generate_random_data_for_classroom():
    room_no = fake.random_int(min=101, max=999)
    if room_no not in rooms:
        rooms.append(room_no)
    capacity = fake.random_int(min=20, max=100)
    building = random.choice(buildings)

    return [str(room_no), str(capacity), f"'{building}'"]


# Generate insert statements for the "course" table
def generate_random_data_for_course():
    global cid
    cid += 1
    course_id = cid
    if course_id not in course_ids:
        course_ids.append(course_id)
    dept_name = random.choice(department_names)
    title = fake.catch_phrase()
    credit = fake.random_int(min=1, max=4)
    return [str(course_id), f"'{dept_name}'", f"'{title}'", str(credit)]


# Generate insert statements for the "prereq" table
def generate_random_data_for_prereq():
    global pid
    pid += 1
    course_id = random.choice(course_ids)
    prereq_id = pid
    return [str(course_id), str(prereq_id)]


# Generate insert statements for the "time_slot" table
def generate_random_data_for_time_slot():
    global tid
    tid += 1

    time_slot_id = tid
    if time_slot_id not in time_slot_ids:
        time_slot_ids.append(time_slot_id)
    day = fake.day_of_week()
    start_time = fake.time()
    end_time = fake.time()
    return [str(time_slot_id), f"'{day}'", f"'{start_time}'", f"'{end_time}'"]


# Generate insert statements for the "section" table
def generate_random_data_for_section():
    course_id = random.choice(course_ids)
    sec_id = fake.random_int(min=1, max=5)
    if sec_id not in sec_ids:
        sec_ids.append(sec_id)

    semester = fake.random_int(min=1, max=2)
    if semester not in semesters:
        semesters.append(semester)
    year = fake.random_int(min=2020, max=2023)
    if year not in years:
        years.append(year)
    room_no = random.choice(rooms)
    building = random.choice(buildings)
    time_slot_id = random.choice(time_slot_ids)
    return [
        str(course_id),
        str(sec_id),
        str(semester),
        str(year),
        str(room_no),
        f"'{building}'",
        str(time_slot_id),
    ]


# Generate insert statements for the "student" table
def generate_random_data_for_student():
    ID = fake.random_int(min=1001, max=1999)
    if ID not in student_ids:
        student_ids.append(ID)
    name = fake.name()
    dept_name = random.choice(department_names)
    tot_cred = fake.random_int(min=0, max=150)
    return [str(ID), f"'{name}'", f"'{dept_name}'", str(tot_cred)]


# Generate insert statements for the "takes" table
def generate_random_data_for_takes():
    ID = random.choice(student_ids)
    course_id = random.choice(course_ids)
    sec_id = random.choice(sec_ids)
    semester = random.choice(semesters)
    year = random.choice(years)
    grade = random.choice(["A", "B", "C", "D", "F"])
    return [
        str(ID),
        str(course_id),
        str(sec_id),
        str(semester),
        str(year),
        f"'{grade}'",
    ]


# Generate insert statements for the "instructor" table
def generate_random_data_for_instructor():
    ID = fake.random_int(min=2001, max=2999)
    name = fake.name()
    dept_name = random.choice(department_names)
    salary = round(random.uniform(50000, 150000), 2)
    return [str(ID), f"'{name}'", f"'{dept_name}'", f"{salary:.2f}"]


# Generate insert statements for the "advisor" table
def generate_random_data_for_advisor():
    id = random.choice(course_ids)
    s_id = id
    i_id = id
    return [str(s_id), str(i_id)]


# Generate insert statements for the "teaches" table
def generate_random_data_for_teaches():
    ID = fake.random_int(min=2001, max=2999)
    course_id = random.choice(course_ids)
    sec_id = random.choice(sec_ids)
    semester = random.choice(semesters)
    year = random.choice(years)
    return [str(ID), str(course_id), str(sec_id), str(semester), str(year)]


# Generate insert statements for each table
table_functions = {
    "department": generate_random_data_for_department,
    "classroom": generate_random_data_for_classroom,
    "course": generate_random_data_for_course,
    "prereq": generate_random_data_for_prereq,
    "time_slot": generate_random_data_for_time_slot,
    "section": generate_random_data_for_section,
    "student": generate_random_data_for_student,
    "takes": generate_random_data_for_takes,
    "instructor": generate_random_data_for_instructor,
    "advisor": generate_random_data_for_advisor,
    "teaches": generate_random_data_for_teaches,
}

i = 0
all_queries = f"queries/all_queries.sql"
queries = ""
for table_name, generator_function in table_functions.items():
    i += 1
    file_name = f"queries/{i}_{table_name}_inserts.sql"

    with open(file_name, "w") as f:
        for _ in range(num_rows):
            values = generator_function()
            insert_statement = (
                f"INSERT INTO {table_name} VALUES ({', '.join(values)});\n"
            )

            queries += insert_statement
            f.write(insert_statement)

prev = ""
with open("all created.sql", "r") as f:
    prev = f.read()
with open(all_queries, "w") as f:
    prev += queries
    f.write(prev)
