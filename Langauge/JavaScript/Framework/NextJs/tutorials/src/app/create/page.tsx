export default async function Create() {
    const res = await fetch('http://localhost:3000/test')
    console.log(res.body);
    return (
        <>
        <div>create</div>
        </>
    )
}