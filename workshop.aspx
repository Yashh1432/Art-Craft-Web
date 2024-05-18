<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="workshop.aspx.cs" Inherits="workshop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="site-wrap">

        <div class="bg-light py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-0"><a href="Default.aspx">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">About</strong></div>
                </div>
            </div>
        </div>

        <div class="site-section border-bottom">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-6">
                        <div class="block-16">
                            <asp:Repeater ID="ProductRepeater" runat="server">
                                <ItemTemplate>
                                    <figure>
                                        <!-- <img src="images/blog_1.jpg" alt="Image placeholder" class="img-fluid rounded"> -->
                                        <%--<iframe width="560" height="315" src="https://www.youtube.com/embed/vkR1YWcWeJw?si=cx6s81t3BhPWwwxp" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>--%>
                                        <a href="workshop.aspx?id=<%# Eval("wid") %>">
                                           <iframe width="560" height="315" src=https://www.youtube.com/embed/"<%# Eval("description") %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

                                        </a>
                                    <%--    <iframe class="video-iframe" src="https://www.youtube.com/embed/YsCeMprm2O0"
                                allowfullscreen></iframe>--%>
                                    </figure>
                                    </div>
                    </div>
                    <div class="col-md-1"></div>
                                    <div class="col-md-5">


                                        <div class="site-section-heading pt-3 mb-4">
                                            <h2 class="text-black">About US</h2>
                                        </div>
                                        <p>
                                            <h3><a href="workshop.aspx?id=<%# Eval("wid") %>"><%# Eval("wname") %></a></h3>

                                            <h4 class="text-md"><%# Eval("link") %></h4>
                                        </p>


                                    </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
            k
k
        </div>
    </div>
</asp:Content>

<%--     Welcome to our Art and Craft Shop Management System, where creativity meets efficiency!

At the heart of every masterpiece lies a spark of inspiration, and our mission is to empower artisans and craft enthusiasts by providing them with a seamless platform to manage, showcase, and sell their creations. With a deep understanding of the intricate world of art and craft, we've designed a comprehensive system tailored to meet the unique needs of both artists and craft shop owners.

Our team comprises passionate individuals from diverse backgrounds.

           
Join us on this creative journey and let us help you turn your passion for art and craft into a thriving business. Whether you're an artist looking to showcase your work or a shop owner seeking to optimize your operations, our Art and Craft Shop Management System is the perfect solution for you.

Thank you for choosing us as your partner in creativity. Together, let's create, inspire, and succeed!--%>