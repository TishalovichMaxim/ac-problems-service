CREATE TABLE IF NOT EXISTS public.problems
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying(300) COLLATE pg_catalog."default" NOT NULL,
    "section-id" smallint NOT NULL,
    description character varying(2000) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT problems_pkey PRIMARY KEY (id),
    CONSTRAINT unq_problems_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS public."problems-sections"
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pk-problems-sections-id" PRIMARY KEY (id),
    CONSTRAINT unq_problems_sections_name UNIQUE (name)
);

ALTER TABLE IF EXISTS public.problems
    ADD FOREIGN KEY ("section-id")
    REFERENCES public."problems-sections" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


-- Insert problem sections (like LeetCode categories)
INSERT INTO
    public."problems-sections"
    (name)
VALUES
    ('Arrays'),
    ('Strings'),
    ('Linked Lists'),
    ('Trees'),
    ('Graphs'),
    ('Dynamic Programming'),
    ('Sorting'),
    ('Searching'),
    ('Math'),
    ('Hash Tables');

-- Insert problems with their respective sections
INSERT INTO
    public.problems
    (name, "section-id", description)
VALUES
    -- Array problems
    ('Two Sum', 1, 'Given an array of integers, return indices of the two numbers such that they add up to a specific target.'),
    ('Best Time to Buy and Sell Stock', 1, 'Find the maximum profit you can achieve from a single buy and sell transaction.'),
    ('Contains Duplicate', 1, 'Determine if any value appears at least twice in the array.'),
    ('Product of Array Except Self', 1, 'Return an array where each element is the product of all elements except the current one.'),

    -- String problems
    ('Valid Palindrome', 2, 'Determine if a string is a palindrome after converting all uppercase letters and removing non-alphanumeric characters.'),
    ('Longest Substring Without Repeating Characters', 2, 'Find the length of the longest substring without repeating characters.'),
    ('Valid Parentheses', 2, 'Determine if the input string has valid parentheses pairing and nesting.'),
    ('String to Integer (atoi)', 2, 'Implement the atoi function which converts a string to an integer.'),

    -- Linked List problems
    ('Reverse Linked List', 3, 'Reverse a singly linked list.'),
    ('Merge Two Sorted Lists', 3, 'Merge two sorted linked lists and return it as a new sorted list.'),
    ('Linked List Cycle', 3, 'Determine if a linked list has a cycle in it.'),
    ('Remove Nth Node From End of List', 3, 'Remove the nth node from the end of the list and return the head.'),

    -- Tree problems
    ('Maximum Depth of Binary Tree', 4, 'Find the maximum depth of a binary tree.'),
    ('Validate Binary Search Tree', 4, 'Determine if a binary tree is a valid binary search tree.'),
    ('Binary Tree Level Order Traversal', 4, 'Return the level order traversal of a binary tree''s nodes.'),
    ('Serialize and Deserialize Binary Tree', 4, 'Design an algorithm to serialize and deserialize a binary tree.'),

    -- Graph problems
    ('Number of Islands', 5, 'Count the number of islands in a 2D grid map.'),
    ('Course Schedule', 5, 'Determine if you can finish all courses given prerequisites represented as a graph.'),
    ('Clone Graph', 5, 'Return a deep copy of an undirected graph.'),
    ('Word Ladder', 5, 'Find the length of shortest transformation sequence from beginWord to endWord.'),

    -- Dynamic Programming problems
    ('Climbing Stairs', 6, 'Count how many distinct ways you can climb to the top of a staircase with n steps.'),
    ('House Robber', 6, 'Determine the maximum amount of money you can rob without alerting adjacent houses.'),
    ('Longest Increasing Subsequence', 6, 'Find the length of the longest increasing subsequence in an array.'),
    ('Coin Change', 6, 'Compute the fewest number of coins needed to make up a given amount.'),

    -- Sorting problems
    ('Merge Sort', 7, 'Implement the merge sort algorithm.'),
    ('Quick Sort', 7, 'Implement the quick sort algorithm.'),
    ('Kth Largest Element in an Array', 7, 'Find the kth largest element in an unsorted array.'),
    ('Sort Colors', 7, 'Sort an array of objects colored red, white, or blue in-place.'),

    -- Searching problems
    ('Binary Search', 8, 'Implement binary search on a sorted array.'),
    ('Search in Rotated Sorted Array', 8, 'Search for a target value in a rotated sorted array.'),
    ('Find Peak Element', 8, 'Find a peak element in an array and return its index.'),
    ('First Bad Version', 8, 'Find the first bad version in a series using minimal API calls.'),

    -- Math problems
    ('Fizz Buzz', 9, 'Return a string representation of numbers with multiples of 3, 5, or both replaced.'),
    ('Count Primes', 9, 'Count the number of prime numbers less than a non-negative number.'),
    ('Power of Three', 9, 'Determine if a given integer is a power of three.'),
    ('Roman to Integer', 9, 'Convert a Roman numeral to an integer.'),

    -- Hash Table problems
    ('Valid Anagram', 10, 'Determine if two strings are anagrams of each other.'),
    ('Group Anagrams', 10, 'Group anagrams together from a list of strings.'),
    ('First Unique Character in a String', 10, 'Find the first non-repeating character in a string.'),
    ('Subarray Sum Equals K', 10, 'Find the total number of continuous subarrays whose sum equals to k.');

