import {Link} from "react-router-dom";
import styles from '../scss/_layouts/_header.module.scss'

export default function Header() {
    const menuList = [
        { name: 'Home', path: '/' },
        { name: 'Atom', path: '/atom' },
        { name: 'Selector', path: '/selector' },
        { name: 'Selector2', path: '/selector2' },
        { name: 'async', path: '/async' },
    ]
    return (
        <header className={styles.container}>
            {
                menuList.map((item, index) => (
                    <Link key={index} to={item.path}>{item.name}</Link>
                ))
            }
        </header>
    );

}