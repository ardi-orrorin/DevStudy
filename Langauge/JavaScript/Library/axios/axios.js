
const axios = require('axios');

const cancelToken = axios.CancelToken.source();

const about = new AbortController();
const signal = about.signal;

function getData(params) { 
    about.abort();
    axios.get('https://jsonplaceholder.typicode.com/comments', {signal})
        .then(data => console.log(`data${params}`))
        .catch(err => console.log(`data${params} canceled`));    
}

let count = 0;
// setInterval(() => {
//     count++
//     getData(count);    
//     if (count % 2 === 0){
//         about.abort();
//     }
// }, 1000);


getData(1);
getData(2);
getData(3);
getData(4);
getData(5);