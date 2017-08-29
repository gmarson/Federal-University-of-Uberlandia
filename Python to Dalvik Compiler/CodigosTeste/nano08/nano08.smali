.class public Lnano08;
.super Ljava/lang/Object;
.source "nano08.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 1
    move-object v0, p0

    move-object v1, v0

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 6
    move-object v0, p0

    const/4 v2, 0x1

    move v1, v2

    .line 7
    move v2, v1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_e

    .line 8
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move v3, v1

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(I)V

    .line 13
    :goto_d
    return-void

    .line 11
    :cond_e
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(I)V

    goto :goto_d
.end method
