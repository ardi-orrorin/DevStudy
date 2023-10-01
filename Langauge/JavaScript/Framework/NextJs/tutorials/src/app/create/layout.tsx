import Header from "@/app/create/header";

export default function Layout({ children }: {children: React.ReactNode }) {
    return(
        <>
            <Header />
            { children }
        </>
    )
}