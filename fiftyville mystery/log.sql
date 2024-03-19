-- Keep a log of any SQL queries you execute as you solve the mystery.
-- checking description from crime scene report on that day
SELECT
    description
FROM
    crime_scene_reports
WHERE
    DAY = 28
    AND MONTH = 7
    AND YEAR = 2021;

--checking the transcript OF people from interview in that date
-- FROM
--     interviews TABLE;

SELECT
    transcript
FROM
    interviews
WHERE
    DAY = 28
    AND MONTH = 7
    AND YEAR = 2021;

--checking the license plate of cars who left the bakery in between given time frame
SELECT
    license_plate
FROM
    bakery_security_logs
WHERE
    DAY = 28
    AND MONTH = 7
    AND YEAR = 2021
    AND HOUR = 10
    AND MINUTE BETWEEN 15 AND 25;

--collecting name from people who have cars of these upper mention number plates
SELECT
    name
FROM
    people
WHERE
    license_plate IN (
        SELECT
            license_plate
        FROM
            bakery_security_logs
        WHERE
            DAY = 28
            AND MONTH = 7
            AND YEAR = 2021
            AND HOUR = 10
            AND MINUTE BETWEEN 15 AND 25
    );


-- taking common name from 4 lists
SELECT
    name
FROM
    people
WHERE
    name IN

--1st list
--Selecting id from flight on the next day of theft
--Then selecting pasport number from passenger where flight id in id(extracted from above query)
--Then selecting the name from people table with the help of passport number

    (
        SELECT
            name
        FROM
            people
        WHERE
            passport_number IN (
                SELECT
                    passport_number
                FROM
                    passengers
                WHERE
                    flight_id IN (
                        SELECT
                            id
                        FROM
                            flights
                        WHERE
                            DAY = 29
                            AND MONTH = 7
                            AND YEAR = 2021
                        ORDER BY
                            HOUR
                        LIMIT
                            1
                    )
            )
--2nd list
--first select caller form phone calls on the theft day.Durationn of call is less then a minute
--after selecting caller number now select name of person who owned selected number.
            AND name IN (
                SELECT
                    name
                FROM
                    people
                WHERE
                    phone_number IN (
                        SELECT
                            caller
                        FROM
                            phone_calls
                        WHERE
                            DAY = 28
                            AND MONTH = 7
                            AND YEAR = 2021
                            AND duration BETWEEN 0 AND 59
                    )
            )

            AND name IN
--3rd list
--select account number details from leggett street atm and transacion type is withdraw
--then select person id from bank account table where account number(extracted from above query) are matched
--now selecting the name from people table by checking the person id(extracted from above query)

            (
                SELECT
                    name
                FROM
                    people
                WHERE
                    id IN (
                        SELECT
                            person_id
                        FROM
                            bank_accounts
                        WHERE
                            account_number IN (
                                SELECT
                                    account_number
                                FROM
                                    atm_transactions
                                WHERE
                                    DAY = 28
                                    AND MONTH = 7
                                    AND YEAR = 2021
                                    AND atm_location = "Leggett Street"
                                    AND transaction_type = "withdraw"
                            )
                    )
            )
--4th list
--first extracting licence plate from bakery security logs
--then the name of people who have the cars with these license plates
            AND name IN (
                SELECT
                    name
                FROM
                    people
                WHERE
                    license_plate IN (
                        SELECT
                            license_plate
                        FROM
                            bakery_security_logs
                        WHERE
                            DAY = 28
                            AND MONTH = 7
                            AND YEAR = 2021
                            AND HOUR = 10
                            AND MINUTE BETWEEN 15 AND 25
                    )
            )
 );
-- output is Bruce


-- finding Bruce's accomplice
--bruce's call reciever number with less then 1 minute call time
--
SELECT
    phone_number
FROM
    people
WHERE
    name = "Bruce";

--calling history of Bruce
SELECT
    receiver
FROM
    phone_calls
WHERE
    caller = "(367) 555-5533"
    AND DAY = 28
    AND MONTH = 7
    AND YEAR = 2021
    AND duration BETWEEN 0 AND 59;

--name of reciever
SELECT
    name
FROM
    people
WHERE
    phone_number = "(375) 555-8161";

--flight destination of bruce
SELECT
    passport_number
FROM
    people
WHERE
    name = "Bruce";

SELECT
    flight_id
FROM
    passengers
WHERE
    passport_number = 5773159633;

--checking destination airport id of bruce's flight
SELECT
    destination_Airport_id
FROM
    flights
WHERE
    id = 36
    AND MONTH = 7
    AND DAY = 29
    AND YEAR = 2021;

--checking the city name through airport id
SELECT
    city
FROM
    airports
WHERE
    id = 4;
