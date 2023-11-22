import React from 'react';
import ErrorPage from "./Error";
export default class ErrorBoundary extends React.Component {
    constructor(props) {
        super(props);

        this.state = { hasError: false };
    }

    static getDerivedStateFromError(error){
        return { hasError: true };
    }
    componentDidCatch(error, info) {
        this.errorInfo = error;
        console.log('componentDidCatch', error, info);
    }
    render() {
        if (this.state.hasError) {
            return this.props.fallback;
        }

        return this.props.children;
    }
}
