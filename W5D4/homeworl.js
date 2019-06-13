function fizzbuzz(array) {
  result = [];
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 !== 0) || (array[i] % 3 !== 0 && array[i] % 5 === 0) {
      result.push(array[i]);
    }
  }
  return result;
}

fizzbuzz([3,5,10,15,20]);

