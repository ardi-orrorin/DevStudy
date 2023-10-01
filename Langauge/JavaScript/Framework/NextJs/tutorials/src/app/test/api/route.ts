import type {NextApiRequest, NextApiResponse} from "next";

type ResponseData = {
    message: string | undefined
}

export async function GET(req: NextApiRequest, res: NextApiResponse<ResponseData>) {
    const url = req.url;
    console.log(url)
    res.status(200).json({message: url});
}