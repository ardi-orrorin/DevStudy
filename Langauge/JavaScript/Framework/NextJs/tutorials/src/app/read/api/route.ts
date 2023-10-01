import {NextRequest, NextResponse} from "next/server";

export async function GET(req: NextRequest, res: NextResponse) {
    const { searchParams } = new URL(req.nextUrl);
    const id = searchParams.get('id');
    console.log(id);
    return res.json();

}