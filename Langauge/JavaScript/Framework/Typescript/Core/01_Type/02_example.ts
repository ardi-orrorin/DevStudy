let itemList;

// 잘못된 예
function items():object{
    const item = [
        {id: 1, title: 'items1-1', done: false},        
        {id: 2, title: 'items1-2', done: false},
        {title: 'items1-2', done: false}, // obejct의 일관성이 없어짐
    ]
    return item;
}
console.log(items());

// 제대로 사용 예
function items2():{id:number, title:string, done:boolean}[] {

    const item = [
        {id: 1, title: 'item2-1', done: false},        
        {id: 2, title: 'item2-2', done: false},        
        // {title: 'item2-2', done: false},  // object의 일관성이 유지됨
    ]
    return item;
}

console.log(items2());

let itemList2:{id:number, title:string, done:boolean}[] = [];

itemList2.push(...items2())
// itemList2.concat(items()) // type error
// itemList2.push(...items()) // type error
itemList2[0].done = true; 
// itemList2[0].done = 'sdf'; // type error 
console.log('itemList2', itemList2);

function itemAdd(todo:{id:number, title:string, done:boolean}):void {
    itemList2.push(todo);
}
// console.log(items()[0]);
console.log('item2()[0]', items2()[0]);

itemAdd(items2()[0]);
console.log('itemlistadd1', itemList2);
// itemAdd(items()[0]); // type error
console.log('itemlistadd2', itemList2);

function itemComplete(index: number, item:{id: number, title: string, done: boolean}): void{
    item.done = true;
    itemList2.splice(index, 1, item);
}

itemComplete(2, itemList2[2]);

console.log('itemComplete', itemList2);

