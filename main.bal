import ballerina/http;
import ballerinax/wso2.controlplane as _;

type Album readonly & record {|
    string title;
    string artist;
|};

table<Album> key(title) albums = table [
    {title: "Blue Train", artist: "John Coltrane"},
    {title: "Jeru", artist: "Gerry Mulligan"}
];

service /hello on new http:Listener(9091) {

    resource function get sayHello() returns string {
        return "Hello, World!";
    }

    resource function get albums/[string title]/[string artist]/[string...]() returns Album[]|http:NotFound {
        return albums.toArray();
    }
}
