const API_KEY = process.env.API_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS;
const contract = require( "../artifacts/contracts/IdentityManagement.sol/IdentityManagement.json" );

// Provider
const alchemyProvider = new ethers.providers.AlchemyProvider("sepolia", API_KEY);

// Signer
const signer = new ethers.Wallet(PRIVATE_KEY, alchemyProvider);

// Contract
const IdentityContract = new ethers.Contract( CONTRACT_ADDRESS, contract.abi, signer );

async function main() {
    const address = await signer.getAddress();
    console.log( "Address: " + address );
    const name = "John Doe";
    const email = "abc@gmail.com"
    const phone = "1234567890";
    const message = await IdentityContract.AddUser( address, name, email, phone );
    console.log( "Message: " + message );
}
main();