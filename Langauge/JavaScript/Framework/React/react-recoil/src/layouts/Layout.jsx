import styles from '../scss/pages/_main.module.scss'
import {Outlet} from "react-router-dom";
import Header from "./Header";
export default function Layout() {

    return (
        <div className={styles.container}>
            <Header />
            <Outlet />
        </div>
    )

}