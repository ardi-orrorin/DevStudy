interface Todo { 
    id: number;
    title: string;
    done: boolean;
}

let itemList3: Todo[] = [];

function items2in(): Todo[] {
    const item = [
        {id: 1, title: 'item2-1', done: false},        
        {id: 2, title: 'item2-2', done: false},
    ]
    return item;
}
function itemAddin(todo: Todo[]):void {
    itemList3.push(...todo);
}

itemAddin(items2in());

function itemCompletein(index: number, item: Todo): void{
    item.done = true;
    itemList3.splice(index, 1, item);
}

itemCompletein(1, itemList3[1]);
console.log(itemList3);

