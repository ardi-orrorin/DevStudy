export default function Read({params}: {params: {id: string}}){
    return (
        <>
            <div>Read</div>
            <div>{params.id}</div>
        </>
    )
}