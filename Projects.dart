void main() {
  List<int>numbers= [10, 52, 2, 15, 73, 29, 8];
  var result= findLargestAndSmallest (numbers);

  print("Largest Number:${result['largest']}"); 
  print("Smallest Number:${result['smallest']}");
}

Map<String,int> findLargestAndSmallest(List<int> numbers) {
  int largest = numbers[0];
  int smallest = numbers[0];

  for(var num in numbers) {
    if (num>largest){
      largest = num;
    } else if (num<smallest) {
      smallest = num;
    }
  } 

return{'largest': largest, 'smallest': smallest};
}