// ajax

// FormData
const formData = new FormData();
formData.append('name','test')
console.log(formData);

// url encoding ajax로 한글주소를 보낼때 생기는 인코딩 문제 해결

const encode = encodeURIComponent('노드');
console.log(encode); // %EB%85%B8%EB%93%9C
const decode = decodeURIComponent(encode);
console.log(decode); // 노드


// dataset
