.class public Lmicro06;
.super Ljava/lang/Object;
.source "micro06.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 3
    move-object v0, p0

    move-object v1, v0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 8

    .prologue
    .line 7
    move-object v0, p0

    new-instance v3, Ljava/util/Scanner;

    move-object v6, v3

    move-object v3, v6

    move-object v4, v6

    sget-object v5, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v4, v5}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    move-object v1, v3

    .line 8
    const/4 v3, 0x0

    move v2, v3

    .line 9
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Digite um numero de 1 a 5: "

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 10
    move-object v3, v1

    invoke-virtual {v3}, Ljava/util/Scanner;->nextInt()I

    move-result v3

    move v2, v3

    .line 11
    move v3, v2

    packed-switch v3, :pswitch_data_50

    .line 29
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Numero Invalido"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 32
    :goto_26
    return-void

    .line 14
    :pswitch_27
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Um"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 15
    goto :goto_26

    .line 17
    :pswitch_2f
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Dois"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 18
    goto :goto_26

    .line 20
    :pswitch_37
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Tres"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 21
    goto :goto_26

    .line 23
    :pswitch_3f
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Quatro"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    goto :goto_26

    .line 26
    :pswitch_47
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Cinco"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    goto :goto_26

    .line 11
    nop

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_27
        :pswitch_2f
        :pswitch_37
        :pswitch_3f
        :pswitch_47
    .end packed-switch
.end method
