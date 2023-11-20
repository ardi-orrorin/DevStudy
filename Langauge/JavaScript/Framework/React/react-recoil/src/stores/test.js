import {atom, selector} from "recoil";


// atom은 하나의 상태를 관리하는 것이다.
export const testStrState = atom({
    key: 'testStrState',
    default: 'test',
    dangerouslyAllowMutability
});

export const testListState = atom({
    key: 'testListState',
    default: [],
});


// selector 안에 의존성을 갖인 atom을 넣으면 하나라도 변경되면 selector가 다시 실행된다.
export const testSelector = selector({
    key: 'testSelector',
    get: ({get}) => {
        const testStr = get(testStrState);
        const testList = get(testListState);
        console.log(get)
        return {
            testStr,
            testList,
        }
    },
})

export const testSelector2 = selector({
    key: 'testSelector2',
    get: ({get}) => {
        const testList = get(testListState);
        const testLength = testList.length;

        return {
            testList,
            testLength,
        }
    },
})