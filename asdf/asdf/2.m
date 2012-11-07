#import <Foundation/Foundation.h>
int main(int argc, char *argv[])

{

NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];

NSFileHandle *inFile, *outFile;

NSData *buffer;

// Open the file testfile for reading 開啟檔案

inFile = [ NSFileHandle fileHandleForReadingAtPath: @"testfile"];

if(inFile == nil) {

NSLog(@"Open of testfile for reading failed");

return 1;

}

// Create the output file first if necessary 建立目的檔

[[NSFileManager defaultManager] createFileAtPath:@"testout"

contents:nil

attributes:nil];

// Now open outfile for writing 開啟目的檔

outFile= [ NSFileHandle fileHandleForWritingAtPath:@"testout"];

if(outFile == nil){

NSLog(@"Open of testout for writing failed");

return 2;

}

// Truncate the output file since it may contain data

[outFile truncateFileAtOffset:0];//將檔案大小設為0Byte

// Read the data from inFile and write it to outFile

buffer = [inFile readDataToEndOfFile];

[outFile writeData:buffer];

// Close the two files

[inFile closeFile];

[outFile closeFile];

//Verify the file's contents

NSLog(@"%@", [NSString stringWithContentsOfFile:@"testout"

encoding: NSUTF8StringEncoding

error: nil]);

[pool drain];

return 0;


}
