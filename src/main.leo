// The 'token_5124' program.
program token_5124.aleo {
    
    record Token {
        owner: address,
        balance: u32,
    }

    // Define a mint transition that takes a balance and returns a token
    transition mint(balance: u32) -> Token {
        return Token {
            owner: self.caller,
            balance: balance
        };
    }

    transition transfer(receiver: address, amount: u32, input: Token) -> (Token, Token){
        let balance: u32 = input.balance - amount;
            let recipient: Token = Token {
            owner: receiver,
            balance: amount
        };

        let sender: Token = Token {
            owner: self.caller,
            balance: balance
        };

        return (recipient, sender);
    }
}
