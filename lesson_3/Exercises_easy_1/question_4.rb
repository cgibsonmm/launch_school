# 4. The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What does the follow method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
numbers.delete(1)

# .delete_at deletes at an index point. so delete_at(1) will always delete the second element in an array.

# delete(1) will search an array for all 1's and delete them
