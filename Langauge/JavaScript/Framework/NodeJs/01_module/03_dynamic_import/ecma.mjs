const a = true;
// if(a) {
//     import './func'; // error
// }
// console.log('성공'); 

if (a) {
    const {func} = await import ('./func');
    console.log(func());
}
console.log('성공');