import { styled } from 'styled-components'

const Basic = () => {
    // Basic
    const Title = styled.h1`
        font-size: 1.5em;
        text-align: center;
        color: palevioletred;
    `;

    // Adapting based on props
    const Button = styled.button`
        background: ${props => props.primary ? 'palevioletred' : 'white'};
        color: ${props => props.primary ? 'white' : 'palevioletred'};
        font-size: 1em;
        margin: 1em;
        padding: 0.25em 1em;
        border-radius: 3px;
    `;

    // Extending Styles 스타일 상속
    const TestButton = styled(Button)`
        background: ${props => props.primary ? 'blue' : 'black'};
        color: ${props => props.primary ? 'skyblue' : 'white'};
    `;

    const ExtendButton = props => (
        <Button {...props} children={props.children.split('').reverse()} />
    );

    // Styling any component
    const Link = ({ className, children }) => (
    <a className={className}>
        {children}
    </a>
    );
    
    const StyledLink = styled(Link)`
    color: palevioletred;
    font-weight: bold;
    `;
    
    // Passed props
    
    const Input = styled.input`
      padding: 0.5em;
      margin: 0.5em;
      color: ${props => props.$inputColor || "red"};
      background: papayawhip;
      border: none;
      border-radius: 3px;
    `;

    return (
        <>
            <h1>Styled Component</h1>
            <Title>Hello World!</Title>
            <br />
            <Button>button Test</Button>
            <Button primary>button Test</Button>
            <br />
            <TestButton>TestButton</TestButton>
            <TestButton primary>TestButton</TestButton>
            <ExtendButton>ExtendBtn</ExtendButton>
            <br />
            <Link>Unstyled Link</Link> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <StyledLink>Styled Link</StyledLink>
            <Input placeholder="A small text input color red" type="text" />
            <Input $inputColor='blue' placeholder="A small text input color blue" type="text" />
        </>
    )
}


export default Basic;