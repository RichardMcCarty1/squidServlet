import React from "react";

export class Dashboard extends React.Component {
    onLogoutClick = e => {
        e.preventDefault();
        //this.props.logoutUser();
        //console.log(this.props.auth)

    };

    render() {
        //const { user } = this.props.auth;
        // hello, {user.name.split(" ")[0]}
        return (

            <div>
                <div style={{
                    margin: "0",
                    position: "absolute",
                    top: "45%",
                    left: "50%",
                    transform: "translate(-50%, -50%)"
                }}><p>Hello world</p>
                    <div className="landing-copy col s12 center-align">
                        <h2>
                            <b>Hello,</b> Josh <b>.</b>
                            <p className="flow-text grey-text text-darken-1">
                                You are logged into SQUID INK.
                            </p>
                        </h2>
                        <button onclick="uploadFile()">Logout</button>
                    </div>
                </div>
            </div>
        );
    }
}
