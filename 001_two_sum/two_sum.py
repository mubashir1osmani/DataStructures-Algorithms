# two sum - check which two numbers == result

def two_sum(self, nums: List[int], target: int) -> List[int]:
    prev_map = {} # map prev key value pairs
    for i, n in enumerate(nums):
        diff = target - n
        if diff in prevMap:
            return [prevMap[diff], i]
        prevMap[n]=i

    return
