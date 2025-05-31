// some blind 75
// two pointers here
class Solution {
public:
	bool isPalindrome(string s) {
		int l = 0, r = s.length() - 1;
		while (l<r) {
			while (l<r && !alphaNum(s[l])) {
				l++;
			}

			while (r>1 && !alphaNum(s[r])) {
				r--;
			}
			if (tolower(s[l]) != tolower(s[r])) {
					return false;
			}
			l++; r--;
		}
		return true;
	}

	bool alphaNum(char c) {
		return (c >= 'A' && c<= 'Z' ||
			c >= 'a' && c <= 'z' || 
			c >= '0' && c <= '9');
	}

	vector<int> twoSum(vector<int>& nums, int target) {
		int l=0, r=nums.size() - 1;
		while (l < r) {
			int sum = nums[l] + nums[r];
			if (sum > target) {
				r--; 
			}
			else if (sum < target) {
				l++;
			}
			else { return { l+1, r+1 }; }
		}

		return {};
	}

	int main() {
		isPalindrome("what the helly");
	}
};
