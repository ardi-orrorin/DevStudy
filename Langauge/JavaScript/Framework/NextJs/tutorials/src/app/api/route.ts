import {NextApiRequest, NextApiResponse} from "next";

type ResponseData = {
    message: string | undefined
}

export async function GET(req: NextApiRequest, res: NextApiResponse<ResponseData>) {
    const url = req.url;
    console.log('df')
    console.log(url)
    return res.json({message: url});

}