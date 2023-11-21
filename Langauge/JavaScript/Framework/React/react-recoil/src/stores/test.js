// import {selector} from "recoil";


// selector 안에 의존성을 갖인 atom을 넣으면 하나라도 변경되면 selector가 다시 실행된다.
// const testSelector = selector({
//     key: 'testSelector',
//     get: ({get}) => {
//         const testStr = get(testStrState);
//         const testList = get(testListState);
//         return {
//             testStr,
//             testList,
//         }
//     },
// })
//
// const testSelector2 = selector({
//     key: 'testSelector2',
//     get: ({get}) => {
//         const testList = get(testListState);
//         const testLength = testList.length;
//         return {
//             testList,
//             testLength,
//         }
//     },
//     set: ({set}, newValue) => {
//         const {testList, testLength} = newValue;
//         set(testListState, testList);
//         set(testStrState, testLength);
//     }
// })