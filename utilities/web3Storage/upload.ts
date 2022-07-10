import "dotenv/config";
import fs from 'fs';
import os from 'os';
import path from 'path';
import { Web3Storage } from "web3.storage";
import { getFilesFromPath } from "web3.storage";

const web3Endpoint = new URL("https://api.web3.storage");
const web3APIKey = process.env.WEB3_STORAGE_TOKEN;
const client = new Web3Storage( { token: web3APIKey , endpoint: web3Endpoint });

export async function web3StorageUpload() {
    try { 
        console.log("🚀  Uploading Blog ...");
        const folderPath = path.join(__dirname, 'blogData/');
        const syncFiles = fs.readdirSync(folderPath);
        const uploadFiles = await getFilesFromPath(folderPath);
        const uploadFilesUri = await client.put(uploadFiles as any, { wrapWithDirectory: false });
        console.log(`💡  cid: ${uploadFilesUri}`);
        console.log(`👀  ipfsUri: ipfs://${uploadFilesUri}`);
        console.log(`🔥  gatewayUri: https://dweb.link/ipfs/${uploadFilesUri}`);
        console.log(`🍷  redirectedUri: https://${uploadFilesUri}.ipfs.web.link`);
    } catch(err) {
        console.error(err)
      } finally {
        process.exit(0)
      }
}

web3StorageUpload();