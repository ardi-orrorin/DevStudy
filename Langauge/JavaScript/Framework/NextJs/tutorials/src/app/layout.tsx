import Header from "@/app/create/header";
import Link from "next/link";

export const metadata = {
  title: 'Create Next App',
  description: 'Generated by create next app',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html>
      <body>
      <ol>
          <li><Link href='/create'>create</Link></li>
          <li><Link href='/read/1'>read/1</Link></li>
          <li><Link href='/read/2'>read/2</Link></li>
      </ol>
        <Header/>
        {children}
      </body>
    </html>
  )
}
