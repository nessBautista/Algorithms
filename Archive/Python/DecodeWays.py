
import string


def decode_ways(digits: str) -> int:
    prefixes = [str(i) for i in range(1,27)]    
    def dfs(idx, memo):
        if idx in memo:
            return memo[idx]

        if idx == len(digits):
            return 1
        ways = 0
        for prefix in prefixes:
            if digits[idx:].startswith(prefix):
                ways += dfs(idx + len(prefix), memo)
        memo[idx] = ways
        return ways
    return dfs(0, {})

if __name__ == '__main__':
    digits = "123"
    res = decode_ways(digits)
    print(res)