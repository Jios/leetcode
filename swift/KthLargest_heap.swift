class KthLargest {
    
    let k: Int 
    var nums = [Int]()
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k 
        for num in nums {
            self.add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        binaryInsert(val)
        if k < nums.count { 
            nums.removeLast()
        }
        return nums.last!
    }
    
    func binaryInsert(_ val: Int) {
        var left = 0 
        var right = nums.count - 1 
        
        while left <= right {
            var mid = (left + right)/2 
            if nums[mid] == val {
                left = mid 
                break
            } else if nums[mid] > val { 
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        nums.insert(val, at: left)
    } 
}

class Heap {
  let max:Int
  
  var arr = [Int]()
  
  func giveCount () -> Int {
    return arr.count
  }
  
  init(_ maxCap:Int) {
    self.max = maxCap
  }
  
  func push(_ input:Int) -> Int? {
    arr.append(input)
    self.bubbleUp(arr.count - 1)
    
    if (arr.count > max) {
      return self.pop()
    }
    return nil
  }
    
  func pop() -> Int {
    guard arr.count > 0 else {
      return 0
    }
    
    let ret = arr[0]
    
    let lastEle = arr.removeLast()
    if (arr.count > 0) {
      arr[0] = lastEle        
      self.bubbleDown(0)
    }
    

    
    return ret
  }
  
  func bubbleUp(_ curIndex:Int) {
    if (arr[curIndex] < arr[curIndex.parent()]) {
      self.swapElements(curIndex, curIndex.parent())
      if (curIndex > 0) {
        self.bubbleUp(curIndex.parent())
      }
    }
  }
  
  func swapElements(_ leftIndex:Int, _ rightIndex:Int) {
    var temp = arr[leftIndex]
    arr[leftIndex] = arr[rightIndex]
    arr[rightIndex] = temp
  }
    

  func bubbleDown(_ curIndex:Int) {
    
    if curIndex.left() < arr.count  && curIndex.right() < arr.count{
      if (arr[curIndex.left()] < arr[curIndex.right()] && arr[curIndex] > arr[curIndex.left()]) {
        self.swapElements(curIndex, curIndex.left())
        self.bubbleDown(curIndex.left())
      } else if (arr[curIndex] > arr[curIndex.right()]){
        self.swapElements(curIndex, curIndex.right())
        self.bubbleDown(curIndex.right())
      }
    } else if curIndex.left() < arr.count,  arr[curIndex] > arr[curIndex.left()] {
        self.swapElements(curIndex, curIndex.left())
        self.bubbleDown(curIndex.left())
    } 
    
  }
  
  
}

extension Int {
  func parent() -> Int {
    return self/2
  }
  func left() -> Int {
    return (self * 2) + 1
  }
  func right() -> Int {
    return (self * 2) + 2
  }
}
/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */