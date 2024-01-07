function debounce() {
    let timeout;
    return function (func, wait) {
        clearTimeout(timeout);
        timeout = setTimeout(func, wait);
    }
}

// debounce Example
// const apiCall = debounce();
// apiCall(()=>console.log(1231), 3000);



