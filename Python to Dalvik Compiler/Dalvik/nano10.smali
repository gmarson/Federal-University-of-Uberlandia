.class public Lnano10;
.super Ljava/lang/Object;
.source "nano10.java"


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
    .registers 6

    .prologue
    .line 6
    move-object v0, p0

    const/4 v3, 0x1

    move v1, v3

    .line 7
    const/4 v3, 0x2

    move v2, v3

    .line 8
    move v3, v1

    move v4, v2

    if-ne v3, v4, :cond_10

    .line 9
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move v4, v1

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(I)V

    .line 14
    :goto_f
    return-void

    .line 12
    :cond_10
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(I)V

    goto :goto_f
.end method
